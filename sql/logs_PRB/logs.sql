import sqlite3

# Conectarse a la base de datos
conn = sqlite3.connect('logs.db')
cursor = conn.cursor()

# Crear la tabla Logs
cursor.execute('''
    CREATE TABLE IF NOT EXISTS Logs (
        log_id INTEGER PRIMARY KEY,
        nivel TEXT,
        mensaje TEXT,
        fecha TIMESTAMP
    )
''')
conn.commit()

# Insertar un log
log_data = {
    'nivel': 'INFO',
    'mensaje': 'Este es un mensaje de información',
    'fecha': '2023-06-01 10:30:00'
}

cursor.execute('''
    INSERT INTO Logs (nivel, mensaje, fecha)
    VALUES (:nivel, :mensaje, :fecha)
''', log_data)
conn.commit()

# Consultar los logs
cursor.execute('SELECT * FROM Logs')
logs = cursor.fetchall()

# Imprimir los logs
for log in logs:
    print('Log ID:', log[0])
    print('Nivel:', log[1])
    print('Mensaje:', log[2])
    print('Fecha:', log[3])
    print('---')

# Cerrar la conexión a la base de datos
conn.close()
