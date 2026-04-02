CREATE DATABASE appointment_db;
USE appointment_db;


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id VARCHAR(8) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- INDEXES
    INDEX idx_customer_id (customer_id),
    INDEX idx_email (email),
    INDEX idx_phone (phone)
);


CREATE TABLE services (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    duration_min INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    
    -- INDEXES
    INDEX idx_service_name (name),
    INDEX idx_category (category)
);


CREATE TABLE staff (
    id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id VARCHAR(8) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    is_active BOOLEAN DEFAULT TRUE,
    
    -- INDEXES
    INDEX idx_staff_id (staff_id),
    INDEX idx_specialization (specialization),
    INDEX idx_active (is_active)
);


CREATE TABLE appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id VARCHAR(8) UNIQUE NOT NULL,
    customer_id VARCHAR(8) NOT NULL,
    service_id INT NOT NULL,
    staff_id VARCHAR(8),
    date DATE NOT NULL,
    time TIME NOT NULL,
    status ENUM('booked','confirmed','completed','cancelled','no-show') DEFAULT 'booked',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- INDEXES (COMPOSITE + SINGLE)
    INDEX idx_date_time (date, time),
    INDEX idx_customer (customer_id),
    INDEX idx_staff (staff_id),
    INDEX idx_status (status),
    INDEX idx_date (date),
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (service_id) REFERENCES services(id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);


-- 1. SERVICES (12 Records)
INSERT INTO services VALUES 
(1,'Haircut',30,25.00,'Regular haircut','Hair'),
(2,'Hair Color',90,75.00,'Full color service','Hair'),
(3,'Manicure',45,35.00,'Nail care service','Nails'),
(4,'Facial',60,50.00,'Skin treatment','Facial'),
(5,'Pedicure',75,45.00,'Foot care service','Nails'),
(6,'Massage',60,80.00,'Relaxation massage','Massage'),
(7,'Hair Wash',20,15.00,'Shampoo service','Hair'),
(8,'Eyebrow Wax',25,20.00,'Eyebrow shaping','Waxing'),
(9,'Full Body Wax',90,90.00,'Complete wax service','Waxing'),
(10,'Makeup',45,60.00,'Party makeup','Makeup'),
(11,'Threading',15,12.00,'Face threading','Threading'),
(12,'Keratin Treatment',180,150.00,'Hair straightening','Hair');

-- 2. CUSTOMERS (15 Records)
INSERT INTO customers (customer_id, name, email, phone, address) VALUES 
('C001','John Doe','john@email.com','555-0101','123 Main St'),
('C002','Jane Smith','jane@email.com','555-0102','456 Oak Ave'),
('C003','Mike Brown','mike@email.com','555-0103','789 Pine Rd'),
('C004','Sarah Wilson','sarah@email.com','555-0104','101 Elm St'),
('C005','David Lee','david@email.com','555-0105','202 Cedar Ln'),
('C006','Lisa Chen','lisa@email.com','555-0106','303 Birch Dr'),
('C007','Tom Wilson','tom@email.com','555-0107','404 Maple St'),
('C008','Emma Davis','emma@email.com','555-0108','505 Walnut Ave'),
('C009','James Park','james@email.com','555-0109','606 Spruce Rd'),
('C010','Anna Kim','anna@email.com','555-0110','707 Fir St'),
('C011','Robert Taylor','robert@email.com','555-0111','808 Redwood Ln'),
('C012','Maria Garcia','maria@email.com','555-0112','909 Sequoia Dr'),
('C013','Chris Evans','chris@email.com','555-0113','1010 Aspen Ave'),
('C014','Linda White','linda@email.com','555-0114','1111 Cypress St'),
('C015','Kevin Patel','kevin@email.com','555-0115','1212 Magnolia Rd');

-- 3. STAFF (10 Records)
INSERT INTO staff (staff_id, name, role, specialization, phone, is_active) VALUES 
('S001','Alice Johnson','Stylist','Hair Color','555-1001',TRUE),
('S002','Bob Wilson','Nail Tech','Manicure/Pedicure','555-1002',TRUE),
('S003','Carol Davis','Esthetician','Facials','555-1003',TRUE),
('S004','David Kim','Massage Therapist','Relaxation Massage','555-1004',TRUE),
('S005','Eva Chen','Stylist','Haircut','555-1005',TRUE),
('S006','Frank Lee','Wax Specialist','Body Waxing','555-1006',TRUE),
('S007','Grace Park','Makeup Artist','Bridal Makeup','555-1007',TRUE),
('S008','Henry Smith','Stylist','Keratin Treatment','555-1008',TRUE),
('S009','Ivy Zhang','Nail Tech','Nail Art','555-1009',TRUE),
('S010','Jack Brown','Manager','All Services','555-1010',TRUE);

-- 4. APPOINTMENTS (20 Records)
INSERT INTO appointments (appointment_id, customer_id, service_id, staff_id, date, time, status, notes) VALUES 
('A001','C001',1,'S005','2024-01-15','10:00:00','confirmed','Regular haircut'),
('A002','C002',2,'S001','2024-01-15','14:30:00','booked','Full color change'),
('A003','C001',3,'S002','2024-01-16','11:00:00','completed','First manicure'),
('A004','C003',4,'S003','2024-01-16','15:00:00','booked','Deep cleansing facial'),
('A005','C004',5,'S009','2024-01-17','09:30:00','confirmed','Pedicure'),
('A006','C005',6,'S004','2024-01-17','13:45:00','booked','60 min massage'),
('A007','C006',1,'S005','2024-01-18','10:30:00','booked','Trim only'),
('A008','C007',7,'S001','2024-01-18','12:00:00','cancelled','Rescheduled'),
('A009','C008',8,'S006','2024-01-19','14:00:00','confirmed','Eyebrows'),
('A010','C009',9,'S006','2024-01-19','16:00:00','booked','Full wax'),
('A011','C010',10,'S007','2024-01-20','11:30:00','confirmed','Party makeup'),
('A012','C011',11,'S007','2024-01-20','13:15:00','booked','Upper lip threading'),
('A013','C012',12,'S008','2024-01-21','09:00:00','booked','Keratin treatment'),
('A014','C001',2,'S001','2024-01-22','15:30:00','booked','Blonde highlights'),
('A015','C013',3,'S002','2024-01-22','10:00:00','confirmed','Nail polish change'),
('A016','C014',4,'S003','2024-01-23','12:30:00','no-show','Did not arrive'),
('A017','C015',1,'S005','2024-01-23','14:00:00','booked','Buzz cut'),
('A018','C002',6,'S004','2024-01-24','11:00:00','confirmed','Back massage'),
('A019','C003',5,'S009','2024-01-24','16:30:00','booked','French pedicure'),
('A020','C004',7,'S001','2024-01-25','10:15:00','booked','Quick wash');



CREATE VIEW daily_schedule AS
SELECT 
    a.date, a.time, a.appointment_id,
    c.name AS customer, c.phone,
    s.name AS service, s.price,
    st.name AS staff,
    a.status, a.notes
FROM appointments a
JOIN customers c ON a.customer_id = c.customer_id
JOIN services s ON a.service_id = s.id
LEFT JOIN staff st ON a.staff_id = st.staff_id
ORDER BY a.date, a.time;

CREATE VIEW revenue_report AS
SELECT 
    DATE(a.date) as appointment_date,
    COUNT(*) as total_appointments,
    SUM(s.price) as total_revenue,
    COUNT(CASE WHEN a.status='completed' THEN 1 END) as completed_count
FROM appointments a
JOIN services s ON a.service_id = s.id
GROUP BY DATE(a.date)
ORDER BY appointment_date DESC;