echo $(sqlite3 ../insurance.db < create_db.sql)
echo $(sqlite3 ../insurance.db < load_db.sql)
echo "insurance.db created and loaded"