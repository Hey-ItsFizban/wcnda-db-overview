from sqlalchemy import create_engine, MetaData, Table, select
from sqlalchemy.orm import sessionmaker

from organization_model import Organization

# Configuration for each database
DATABASES = {
    # 'SQLite': 'sqlite:///db_init/organization.db',
    'MySQL': 'mysql+pymysql://root:root@localhost/emedgene_v6_demo',
    'PostgreSQL': 'postgresql+psycopg2://root:root@localhost/emedgene_v6_demo'
}


# Function to get and print the first row
def get_and_print_first_row(engine, dialect_name):
    Session = sessionmaker(bind=engine)
    session = Session()
    metadata = MetaData(bind=engine)
    result = session.query(Organization).first()
    print(f"Dialect: {dialect_name}, First Row: {result}")


# Iterate over the databases
for dialect, db_uri in DATABASES.items():
    engine = create_engine(db_uri)
    get_and_print_first_row(engine, dialect)
