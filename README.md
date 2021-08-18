[This is the updated version of the project using OpenAI's GPT3. The previous version used Huggingface’s pre-trained ConvAI model
The source files for the previous version can be obtained from  [here](https://github.com/AjayKhalsa/convai_smile).]

This is a proof of concept of an AI Therapist using GPT3. While an not a human, the AI responds like a real therapist, and gives useful recommendations based on what you are dealing with. This should lower 'social bar' for people going to therapy. No longer will people have to schedule appointments, pay ridiculous fees, or waste time trying to find a perfect match. Just talk with an AI who won't judge you but responds just like a therapist. 

Uses GPT3 to power all the recommendations. In order to clone and use the repo, you'll need to get access to the GPT3 API and plug in your own secret key. 

Uses Shane Lynn's asynch flask code as a starter. 


If you just need to use the web version of the chatbot please clone the repository got to backend directory and then set up your virtual environment using the requirements.txt file with pip and virtualenv. You can achieve this with:


    cd async_flask
    virtualenv AI-Therapist
    ./AI-Therapist/Scripts/activate
    pip install -r requirements.txt  #(or in Windows - sometimes python -m pip install -r requirements.txt )



Start the application with:

<code>
python application.py
</code>

And visit http://localhost:5000 to see the updating numbers.

