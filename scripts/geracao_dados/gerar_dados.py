from faker import Faker
import pandas as pd
import random
from pathlib import Path

fake = Faker("pt_BR")

TOTAL_CLIENTES = 100
TOTAL_PRODUTOS = 50
TOTAL_PEDIDOS = 200
TOTAL_ITENS = 500

BASE_DIR = Path(__file__).resolve().parents[2]
DATA_DIR = BASE_DIR / "data" / "bruto"

print(BASE_DIR)
print(DATA_DIR)