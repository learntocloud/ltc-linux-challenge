# API Development with FastAPI

## What is an API?

Imagine you're at a restaurant. You, the customer, are like a computer program that wants some information or wants something done. The waiter is like an API - you don't go directly to the kitchen (the database or system) to get your food. Instead, you give your order to the waiter (make an API request), and the waiter brings back your food (the API response).

An API (Application Programming Interface) works similarly:

1. You make a request for some data or action.
2. The API processes that request.
3. The API sends back a response with the data or confirmation of the action.

## What We're Building

In this lab, we're going to build an API for a movie database. By the end, you'll be able to:

- Get a list of movies
- Add new movies
- Update movie information
- Delete movies
- Search for movies

And you'll do all this without ever seeing the actual database - just like you enjoy your meal without going into the restaurant's kitchen!

## Let's Get Started

First, let's make sure everything is set up correctly.

1. In your terminal, type the following command and press Enter:

    ``` sh
    python --version
    ```

    You should see a version number. If you don't, please install Python.

2. Now, let's create our project folder. Type:

    ``` sh
    mkdir movie_api 
    cd movie_api
    ```
    
3. Let's create a virtual environment (a special place for our project's tools):

    ``` sh
    python -m venv venv
    ```

4. Activate the virtual environment:
    - On Windows, type: `venv\Scripts\activate`
    - On macOS or Linux, type: `source venv/bin/activate`

5. Install FastAPI and Uvicorn:

    ``` sh
    pip install fastapi uvicorn
    ```

6. Create a new file called `main.py` and open it in your favorite text editor.
7. In `main.py`, type the following:

    ``` python
    from fastapi import FastAPI

    app = FastAPI()

    @app.get("/")
    def read_root():
    return {"message": "Welcome to the Movie API!"}
    ```

8. Save the file and go back to your terminal. Run your API with:

    ``` sh
    uvicorn main:app --reload
    ```

9. Open a web browser and go to `http://localhost:8000`. You should see a JSON response with your welcome message!

Congratulations! You've just created your first API endpoint. Further, we'll start adding movie-related features to our API.

Remember, every expert was once a beginner. Take your time.
