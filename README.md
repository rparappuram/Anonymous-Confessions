# Inspiration
We all at one point wanted to let someone know information anonymously, whether its a loved one, your crush, or just drama. We saw an opportunity to do this, so we created something easy to use.

# What it does
The website and app both have two texts boxes, one for your anonymous message and one for the phone number of the person you are trying to contact. When you fill them out and click send, the number will get a text that contains the message from a random number. We used a machine learning model to detect spam so that spam is not sent using our service

# How we built it
We built this using HTML, CSS, JavaScript, and Python's Flask as the backend. We utilized Scikit-learn for the machine learning/natural language processing model. We also used google cloud and firebase to deploy the front-end.

# Challenges we ran into
We were challenged when attempting to run our project on a hosting service, specifically firebase and google-cloud. Moreover, sometimes the texts did not send to the requested phone number, so we had to debug and understand what was going wrong.

# Accomplishments that we're proud of
We are proud of making a fully functioning web-application, along with a functioning mobile-app that actually fulfills our purpose. Moreover, we are proud of completing this project in such a short time.

# What we learned
We learned a lot about how to host our project onto a domain. Furthermore, we gained insight about app-development, specifically using Flutter and Dart. Additionally, we learned more about machine learning, specifically natural language processing as we used a sklearn model to detect spam.

# What's next for Anonymous Confessions
Right now, we are using the free trial for twilio, which only allows us to send texts to verified numbers. In the future, we desire to possibly upgrade our twilio account, or maybe even discover another way to send texts. By upgrading, we will completely be able to fulfill our purpose as we can send texts to any number.

# Built With
css, firebase, flask, google-cloud, html5, javascript, python, scikit-learn

# Try it out
anonymous-texting-51c68.web.app
