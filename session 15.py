# Session 15 - SQLite + Pandas
# Question-Answer Format

# ============================================================
# Q1. Install the sqlite3 module in Python and create foodie.db
#     with a Restaurants table.
# ============================================================

# Answer:
# sqlite3 is built into Python, so normally no separate installation
# is required. We can directly import it.

import sqlite3
import pandas as pd

# Connect to (or create) the database
connection = sqlite3.connect("foodie.db")

cursor = connection.cursor()

# Create the Restaurants table
cursor.execute("""
CREATE TABLE IF NOT EXISTS Restaurants (
    id INTEGER PRIMARY KEY,
    name TEXT,
    cuisine TEXT,
    rating REAL
)
""")

connection.commit()

print("Q1: foodie.db database and Restaurants table created successfully.")

# ============================================================
# Q2. Insert three sample restaurants and fetch restaurants
#     with a rating above 4.0.
# ============================================================

# Answer:

restaurants = [
    (1, "Bella Italia", "Italian", 4.5),
    (2, "Spice Garden", "Indian", 4.2),
    (3, "Sushi House", "Japanese", 3.9)
]

cursor.executemany("""
INSERT OR REPLACE INTO Restaurants (id, name, cuisine, rating)
VALUES (?, ?, ?, ?)
""", restaurants)

connection.commit()

# Fetch restaurants with rating above 4.0
cursor.execute("""
SELECT name
FROM Restaurants
WHERE rating > 4.0
""")

results = cursor.fetchall()

print("\nQ2: Restaurants with rating above 4.0:")
for restaurant in results:
    print(restaurant[0])

# ============================================================
# Q3. Load all rows from Restaurants into a Pandas DataFrame
#     and display the top 2 rows using DataFrame.head().
# ============================================================

# Answer:

query = "SELECT * FROM Restaurants"

df = pd.read_sql_query(query, connection)

print("\nQ3: Top 2 rows:")
print(df.head(2))

# ============================================================
# Q4. Add delivery_charge = 50 and calculate final_rating.
#     Add 0.1 to rating if cuisine is Italian.
# ============================================================

# Answer:

df["delivery_charge"] = 50

df["final_rating"] = df.apply(
    lambda row: row["rating"] + 0.1
    if row["cuisine"] == "Italian"
    else row["rating"],
    axis=1
)

print("\nQ4: Updated DataFrame:")
print(df)

# ============================================================
# Q5. Automate a daily summary:
#     Fetch restaurants with rating above 4.5, load them into
#     a DataFrame, and save as top_rated_restaurants.csv.
# ============================================================

# Answer:

top_rated_query = """
SELECT *
FROM Restaurants
WHERE rating > 4.5
"""

top_rated_df = pd.read_sql_query(top_rated_query, connection)

top_rated_df.to_csv("top_rated_restaurants.csv", index=False)

print("\nQ5: Daily summary saved as top_rated_restaurants.csv.")

# Close the database connection
connection.close()

print("\nAll Session 15 questions completed successfully.")
