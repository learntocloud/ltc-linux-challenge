# Movie/TV Show API Lab using Python

## Lab Objective

Build a simple API for managing movie information using FastAPI and Python, with a focus on learning fundamental concepts of API development.

## Technologies Used

- Python: The programming language we'll use
- FastAPI: A modern, fast Python web framework for building APIs
- SQLite: A lightweight, file-based database (easier to set up than PostgreSQL)
- Pydantic: For data validation (built into FastAPI)

## Lab Structure

### 1. Introduction to APIs and FastAPI

- What is an API?
- Introduction to FastAPI and its benefits
- Setting up the development environment

### 2. Hello World API

- Create a simple "Hello, World!" endpoint
- Run the API using Uvicorn
- Test the API using a web browser and curl

### 3. Basic Movie API

- Create a simple in-memory movie database (using a Python list)
- Implement basic CRUD operations:
  - `GET /movies`: List all movies
  - `GET /movies/{id}`: Get a specific movie
  - `POST /movies`: Add a new movie
  - `PUT /movies/{id}`: Update a movie
  - `DELETE /movies/{id}`: Delete a movie

### 4. Data Validation

- Introduction to Pydantic models
- Create a MovieCreate and Movie model
- Update endpoints to use these models

### 5. Database Integration

- Introduction to SQLite and databases
- Set up a SQLite database
- Modify API to use the database instead of in-memory list

### 6. Error Handling

- Implement basic error handling
- Return appropriate HTTP status codes

### 7. Simple Search Functionality

- Add a search endpoint to find movies by title

### 8. API Documentation

- Explore FastAPI's automatic interactive API documentation

## Challenges

## Learning Outcomes

- Understanding of what an API is and how it works
- Basic proficiency in using FastAPI to create API endpoints
- Familiarity with HTTP methods and status codes
- Introduction to data validation in APIs
- Basic database operations
- Exposure to API documentation

## Setup Instructions

- [Step 1](./step1/README.md) - Installing Python, Setting up a virtual environment, installing required packages and running the API locally
- [Step 2]()

## Resources

Links to helpful resources:

- [Python basics](https://7daysofpython.com)
- [FastAPI documentation](https://fastapi.tiangolo.com/)
- [HTTP methods explanation](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)
- [RESTful API design principles](https://stackoverflow.blog/2020/03/02/best-practices-for-rest-api-design/)
