import json
from sqlalchemy import create_engine, Column, Integer, String, select, func, case, cast
from sqlalchemy.orm import declarative_base, Session
from sqlalchemy.ext.hybrid import hybrid_property

# Define the base class
Base = declarative_base()


class Organization(Base):
    __tablename__ = 'organization'
    id = Column(Integer, primary_key=True)
    organization_name = Column(String)
    settings = Column(String)  # JSON type for PostgreSQL, Text for SQLite and MySQL

    @hybrid_property
    def is_automated(self):
        settings_json = json.loads(self.settings)
        return settings_json.get('is_automated')

    @is_automated.expression
    def is_automated(cls):
        return case([
            (func.lower(func.substr(cast(cls.settings, String), 1, 1)) == '{',
             cast(func.json_extract(cls.settings, '$.is_automated'), String) == 'true')
        ], else_=cls.settings)

# Path to your .sql file
sql_file_path = 'db_init/sqlite.sql'

# Create the SQLite database and initialize it from the .sql file
engine = create_engine('sqlite:///organization.db')
Base.metadata.create_all(engine)

# Execute SQL commands from the .sql file
with engine.connect() as connection:
    with open(sql_file_path, 'r') as sql_file:
        sql_commands = sql_file.read()
        connection.execute(sql_commands)

# Create a new session
session = Session(engine)

# Query using the ORM property
query = select(Organization).where(Organization.is_automated == True)
result = session.execute(query).scalars().all()

# Print the results
for org in result:
    print(f"Dialect: SQLite, Organization ID: {org.id}, Name: {org.organization_name}")

# Close the session
session.close()
