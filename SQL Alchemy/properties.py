from urllib.parse import quote_plus
class Environment:
    def __init__(self):
        self.user = ""
        self.password = ""
        self.endpoint = ""
        self.port = ""
        self.db = ""

        self.user, self.password, self.endpoint, self.port, self.db = [self.deal_with_speial_characters(v) for v in [self.user, self.password, self.endpoint, self.port, self.db]]

    def deal_with_speial_characters(self, value):
        try:
            if value:
                value = quote_plus(value)
                return value
            raise
        except Exception as e:
            raise