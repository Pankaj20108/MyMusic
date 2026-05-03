# MyMusic - Spotify Clone & Song Manager

MyMusic is a modern, responsive web application built with Java, JSP, and MySQL. It allows users to manage their music collection by adding, searching, and deleting songs. A standout feature is the "Play" button, which instantly redirects users to YouTube to listen to their favorite tracks.

## ✨ Features

-   **Add Songs**: Quickly add new songs by title and artist.
-   **Song List**: View all your added songs in a clean, professional table.
-   **Search Functionality**: Effortlessly search for songs by title or artist.
-   **Delete Songs**: Remove songs from your collection with a single click.
-   **YouTube Integration**: "Play" any song directly on YouTube via an automated search query.
-   **Modern UI**: Beautifully designed using **Bootstrap 5**, featuring a Spotify-inspired aesthetic, responsive layout, and interactive elements.

## 🚀 How to Run

### Prerequisites

-   **Java JDK 8 or higher**
-   **Maven** (for dependency management)
-   **MySQL Server**
-   **Apache Tomcat** (or any Servlet container)

### 1. Database Setup

1.  Open your MySQL client (e.g., MySQL Workbench, CMD).
2.  Execute the SQL script located in `db/song_manager_youtube_feature.sql` to create the database and table.
    ```sql
    CREATE DATABASE IF NOT EXISTS Spotify_V2;
    USE Spotify_V2;

    CREATE TABLE IF NOT EXISTS songs (
      id INT PRIMARY KEY AUTO_INCREMENT,
      title VARCHAR(255) NOT NULL,
      artist VARCHAR(255) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    ```
3.  (Optional) The script also includes some sample data to get you started.

### 2. Configure Database Connection

Open `src/main/java/com/example/songmanager/DBConnection.java` and ensure the database credentials match your local MySQL setup:

```java
private static final String URL = "jdbc:mysql://127.0.0.1:3306/Spotify_V2";
private static final String USER = "root";
private static final String PASS = "your_password"; // Update this
```

*Alternatively, you can set environment variables `DB_URL`, `DB_USER`, and `DB_PASS`.*

### 3. Build the Project

Run the following Maven command in the project root:

```bash
mvn clean package
```

This will generate a `MyMusic.war` (or `untitled4.war`) file in the `target/` directory.

### 4. Deploy and Run

1.  Copy the generated `.war` file to the `webapps` folder of your Tomcat installation.
2.  Start Tomcat.
3. Access the application at `http://localhost:8080/MyMusic/songs` (where `MyMusic` is your deployment context).

## 🛠️ Technologies Used

-   **Backend**: Java (Servlets), JSP, Maven
-   **Database**: MySQL
-   **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
-   **Styling**: Spotify-themed UI with custom shadow effects and responsive grid.

## 📂 Project Structure

-   `src/main/java`: Backend logic (Servlets, DAO, Model).
-   `src/main/webapp`: Frontend pages (JSP) and configuration.
-   `db/`: SQL scripts for database initialization.
-   `pom.xml`: Maven dependencies.

---
