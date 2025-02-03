#!/bin/bash

sqlite3 items.db <<EOF
CREATE TABLE IF NOT EXISTS items (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    category TEXT NOT NULL,
    timeLimit INTEGER NOT NULL,
    status TEXT NOT NULL,
    dueDate TEXT,
    location TEXT
);
EOF
