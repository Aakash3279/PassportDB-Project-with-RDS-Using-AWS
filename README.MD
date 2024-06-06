## Amazon RDS (Relational Database Service) Overview

Amazon RDS (Relational Database Service) is a managed relational database service provided by Amazon Web Services (AWS). It simplifies the setup, operation, and scaling of relational databases in the cloud. RDS supports several popular database engines, including MySQL, PostgreSQL, MariaDB, Oracle, Microsoft SQL Server, and Amazon Aurora.

### Key Features of Amazon RDS

- **Managed Service:** RDS automates time-consuming tasks such as hardware provisioning, database setup, patching, and backups, allowing developers to focus on application development.
- **Scalability:** RDS provides easy scaling options. You can scale your database's compute and storage resources with just a few clicks or API calls.
- **High Availability:** RDS supports multi-AZ deployments, ensuring that your database remains available during planned maintenance, hardware failure, or any unexpected outages.
- **Read Replicas:** To improve read performance, RDS offers read replicas that allow read-heavy database workloads to scale out.
- **Automated Backups:** RDS automatically backs up your database and allows point-in-time recovery, ensuring data durability and recoverability.
- **Security:** RDS provides multiple security features, including network isolation using VPC, encryption at rest and in transit, and AWS Identity and Access Management (IAM) for managing access to your databases.
- **Monitoring and Metrics:** RDS integrates with AWS CloudWatch for monitoring and provides detailed performance insights, including CPU utilization, disk I/O, and more.

Overall, Amazon RDS simplifies database management tasks, enhances scalability, provides robust security, and ensures high availability, making it an ideal choice for running relational databases in the cloud.


Here is a step-by-step guide to create an SQL database for passport applicant details and connect it to AWS RDS.

### Step 1: Create an RDS MySQL Instance on AWS

1. **Log in to the AWS Management Console**.
2. Navigate to the **RDS Dashboard**.
3. Click on **Create database**.
4. Choose **Standard Create**.
5. Select **MySQL** as the engine.
6. Choose the **Free Tier** or the appropriate DB instance class for your needs.
7. Set up the DB instance details (DB instance identifier, Master username, and Master password).
8. Configure advanced settings:
   - Set **VPC** and **Subnet group**.
   - Choose **Publicly accessible** if you want to access the database from outside the VPC.
   - Configure **Database options** (Database name, Parameter group, Option group).
   - Set up **Backup retention**, **Monitoring**, **Maintenance**, and **Deletions protection**.
9. Click on **Create database** and wait for the instance to be available.

### Step 2: Configure Security Groups

1. Go to the **EC2 Dashboard**.
2. Click on **Security Groups**.
3. Find the security group associated with your RDS instance.
4. Edit the **Inbound rules** to allow your IP address to connect to the MySQL port (default is 3306).

### Step 3: Connect to Your RDS Instance

You can connect to your RDS instance using any MySQL client, such as MySQL Workbench or command line.

For example, using the command line:
```bash
mysql -h <your-rds-endpoint> -P 3306 -u <master-username> -p
```

### Step 4: Create the SQL Database and Tables

Once connected to your RDS instance, execute the following SQL commands to create the database and tables:

```sql
-- Create the database
CREATE DATABASE passport_applicants;

-- Use the database
USE passport_applicants;

-- Create the applicants table
CREATE TABLE applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    passport_number VARCHAR(20) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- Create the travel_history table
CREATE TABLE travel_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    country_visited VARCHAR(100),
    date_of_entry DATE,
    date_of_exit DATE,
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id)
);
```

### Step 5: Insert Sample Data

Insert some sample data to test the database:

```sql
-- Insert sample data into applicants
INSERT INTO applicants (first_name, last_name, date_of_birth, passport_number, issue_date, expiry_date, nationality, address, phone_number, email)
VALUES ('John', 'Doe', '1990-01-01', 'A12345678', '2022-01-01', '2032-01-01', 'American', '123 Main St, Anytown, USA', '123-456-7890', 'john.doe@example.com');

-- Insert sample data into travel_history
INSERT INTO travel_history (applicant_id, country_visited, date_of_entry, date_of_exit)
VALUES (1, 'Canada', '2022-06-01', '2022-06-15');
```

### Step 6: Verify the Data

Query the data to verify that everything is set up correctly:

```sql
-- Verify applicants
SELECT * FROM applicants;

-- Verify travel history
SELECT * FROM travel_history;
```

By following these steps, you have created an SQL database for passport applicant details and connected it to AWS RDS.


