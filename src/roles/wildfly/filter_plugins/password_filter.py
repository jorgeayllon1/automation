import hashlib

def wildfly_password_filter(value: str):

    return hashlib.md5(value.encode()).hexdigest()


class FilterModule:
    def filters(self):
        return {
            'wildfly_password_filter': wildfly_password_filter
        }
