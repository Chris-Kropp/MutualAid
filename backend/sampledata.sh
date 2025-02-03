#!/bin/bash

sqlite3 items.db <<EOF
INSERT INTO items (name, description, category, timeLimit, status, dueDate, location) VALUES
('Cordless Drill', 'A powerful cordless drill for DIY projects.', 'Tools,Home', 14, 'available', NULL, 'Springfield'),
('Camping Tent', 'A four-person camping tent for outdoor adventures.', 'Sports,Outdoors', 7, 'borrowed', '2025-02-10T00:00:00', 'Riverside'),
('Python Programming Book', 'A book that teaches Python programming from basics to advanced.', 'Books,Technology', 30, 'available', NULL, 'Greenwich'),
('Sewing Machine', 'A heavy-duty sewing machine for quilting and repairs.', 'Tools,Home', 30, 'available', NULL, 'Harrison'),
('Recliner Chair', 'A comfy recliner chair for sitting and relaxing.', 'Furniture,Home', 60, 'unavailable', NULL, 'Fairview'),
('Power Saw', 'A power saw for cutting wood and other materials.', 'Tools,Home', 14, 'available', NULL, 'Brooklyn'),
('Blender', 'A high-performance blender for smoothies and shakes.', 'Kitchen,Appliances', 7, 'available', NULL, 'Portland'),
('Mountain Bike', 'A sturdy bicycle for mountain trails.', 'Transport,Sports', 21, 'borrowed', '2025-02-15T00:00:00', 'Maplewood'),
('Gardening Kit', 'A complete gardening kit with tools for planting.', 'Gardening,Outdoors', 14, 'available', NULL, 'Lakewood'),
('Bluetooth Speaker', 'A portable speaker for music on the go.', 'Electronics,Music', 10, 'unavailable', NULL, 'Middletown'),
('Camping Gear Set', 'A set of essential gear for camping trips.', 'Outdoors,Camping', 7, 'borrowed', '2025-02-12T00:00:00', 'Cedarville'),
('Fitness Tracker', 'A wearable device to track your fitness goals.', 'Electronics,Fitness', 30, 'available', NULL, 'Salem'),
('Corded Hammer Drill', 'A corded hammer drill for heavy-duty drilling.', 'Tools,Home', 14, 'requested', NULL, 'Kingston'),
('Chainsaw', 'A chainsaw for cutting down trees and heavy-duty woodwork.', 'Tools,Home', 60, 'available', NULL, 'Silverstone'),
('Coffee Maker', 'A coffee maker for brewing fresh coffee every morning.', 'Kitchen,Appliances', 30, 'unavailable', NULL, 'Lakeside'),
('Projector', 'A portable projector for movie nights.', 'Electronics,Entertainment', 21, 'borrowed', '2025-02-25T00:00:00', 'Greenville'),
('Board Game Set', 'A collection of fun board games for family nights.', 'Games,Entertainment', 30, 'available', NULL, 'Claremont'),
('Workbench', 'A sturdy workbench for all your crafting and DIY projects.', 'Tools,Home', 14, 'requested', NULL, 'Newton'),
('Smart Thermostat', 'A smart thermostat to control the temperature of your home.', 'Electronics,Home Automation', 60, 'available', NULL, 'Bristol'),
('Vacuum Cleaner', 'A vacuum cleaner to keep your home spotless.', 'Home,Appliances', 7, 'unavailable', NULL, 'Fresno'),
('Drone', 'A drone for aerial photography and videography.', 'Electronics,Photography', 14, 'available', NULL, 'Ashford');
EOF
