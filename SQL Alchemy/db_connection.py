from urllib.parse import quote_plus

from sqlalchemy.orm import sessionmaker, Session
from sqlalchemy.sql import Select, Insert, Update
from sqlalchemy import create_engine, func, text, select, insert, update, VARCHAR
from sqlalchemy.orm import declarative_base, Mapped, mapped_column

from properties import Environment

base = declarative_base()

class OPS_REVIEW_TABLE(base):
    __tablename__ = "ops_review_table"
    content_relation_id : Mapped[str] = mapped_column(VARCHAR(50), primary_key= True)
    review_status : Mapped[str] = mapped_column(VARCHAR(50), primary_key=False)


class DB:
    def __init__(self):

        self.env = Environment()
        self.user = self.env.user
        self.password = self.env.password
        self.endpoint = self.env.endpoint
        self.port = self.env.port
        self.db = self.env.db

        self.engine = None
        self.session = None

    def database_setup(self):
        try:
            db_url = f"mysql+pymysql://{self.user}:{self.password}@{self.endpoint}:{self.port}/{self.db}"
            print(f"db_url: {db_url}")
            self.engine = create_engine(db_url, echo=False, pool_size=5, pool_pre_ping=True)
            if self.engine:
                test_query = select(func.version())
                conn = self.engine.connect()
                response = conn.execute(test_query)
                if isinstance(test_query, Select):
                    print(f"Response: {response.fetchall()}")
                    return
                conn.close()
        except Exception as e:
            raise
    
    def create_session(self):
        try:
            if not self.engine:
                self.database_setup()
            
            self.session = sessionmaker(bind=self.engine, class_=Session, autoflush=True, expire_on_commit=True)
            if self.session:
                self.session = self.session()
                print(f"db session has been created successfully: {self.session}")
                return
            raise

        except Exception as e:
            raise

    def prepare_query(self, query_type, content_relation_id, review_status):
        try:
            match query_type:
                case "select":
                    return select(OPS_REVIEW_TABLE.content_relation_id,OPS_REVIEW_TABLE.review_status).where(OPS_REVIEW_TABLE.content_relation_id == str(content_relation_id))
                case "update":
                    return update(OPS_REVIEW_TABLE).where(OPS_REVIEW_TABLE.content_relation_id == str(content_relation_id)).values(review_status = str(review_status))
                case "insert":
                    return insert(OPS_REVIEW_TABLE).values(content_relation_id = str(content_relation_id), review_status = str(review_status))
                
                case "merge":
                    return OPS_REVIEW_TABLE(content_relation_id = content_relation_id, review_status = review_status)
                case "":
                    raise
                
        except Exception as e:
            raise
    
    def execute_select_query(self, query):
        try:
            if query is not None:
                print(query)
                response = self.execute_query(query=query)
                if response:
                    print(f"{query} \nresponse: {response}")
                    return
                raise
            raise

        except Exception as e:
            raise
    def execute_update_query(self, query):
        try:
            if query is not None:
                print(query)
                response = self.execute_query(query=query)
                if response:
                    print(f"{query} \nresponse: {response}")
                    return
                raise
            raise

        except Exception as e:
            raise

    def execute_insert_query(self, query):
        try:
            if query is not None:
                response = self.execute_query(query=query)
                if response:
                    print(f"{query} \nresponse: {response}")
                    return
                raise
            raise

        except Exception as e:
            raise
    
    def execute_merge_query(self, query):
        try:
            if query is not None:
                response = self.execute_query(query=query)
                if response:
                    print(f"{query} \nresponse: {response}")
                    return
                raise
            raise

        except Exception as e:
            raise

    def execute_query(self, query):
        try:
            if self.session is not None and query is not None:
                if isinstance(query, OPS_REVIEW_TABLE):
                    response = self.session.merge(query)
                    return response
                
                response = self.session.execute(query)
                if isinstance(query, Select):
                    response = response.fetchall()
                    return response
                elif isinstance(query, Update):
                    return response.rowcount
                elif isinstance(query, Insert):
                    return response.rowcount
        except Exception as e:
            self.session.rollback()
            raise
        finally:
            if self.session:
                self.session.commit()


def main():
    try:
        db = DB()
        db.database_setup()
        db.create_session()

        while True:
            query_type = str(input("entry query type ['select', 'insert', 'update', 'merge']: "))
            content_relation_id = str(input("enter content_relation_id: "))
            review_status = str(input("enter review_status: "))
            query = db.prepare_query(query_type=query_type, content_relation_id=content_relation_id, review_status=review_status)
            match query_type:
                case "select":
                    db.execute_select_query(query=query)
                case "update":
                    db.execute_update_query(query=query)
                case "insert":
                    db.execute_insert_query(query=query)
                case "merge":
                    db.execute_merge_query(query = query)
            if not query_type or not content_relation_id or not review_status:
                break
    except Exception as e:
        raise

if __name__ == "__main__":
    main()