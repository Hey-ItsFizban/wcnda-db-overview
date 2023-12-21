from sqlalchemy import create_engine, select
from sqlalchemy import select
from sqlalchemy.orm import Session

from organization_model import Base
from organization_model import Organization

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
