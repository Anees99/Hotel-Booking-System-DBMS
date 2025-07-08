# Hotel Booking System (DBMS Project)

A Laravel-based Hotel Booking System developed as part of a Database Management Systems course project.

##  Deployment
- Website: https://hotelbooking-production-a87e.up.railway.app/favicon.ico
- Admin Login:
  - Email: admin@example.com
  - Password: ********

##  Requirements
- PHP 7.4 or 8.1+
- MySQL 5.7+/8.0+
- Composer
- Laravel 10+
- XAMPP or Laravel Valet (recommended for local setup)

##  Setup Instructions

1. Clone or Download this repository:
   ```bash
   git clone https://github.com/your-username/hotel-booking-system.git
   cd hotel-booking-system
   
2. Install dependencies:
    ```bash
   composer install
   npm install
   npm run dev

4. Create and configure your .env file:
   ```bash 
   cp .env.example .env
   php artisan key:generate

6. Set database credentials in .env:
   ```bash
   DB_DATABASE=hotel_db
   DB_USERNAME=root
   DB_PASSWORD=

8. Run migrations and seed database:
   ```bash
   php artisan migrate --seed

9. Start the development server:
   ```bash
   php artisan serve
