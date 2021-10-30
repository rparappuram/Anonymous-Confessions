import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import LinearSVC
from sklearn.pipeline import Pipeline
import pickle

class Model:
    def __init__(self, fileName):
        #trainModel(fileName)
        self.openModel()

    def trainTest(self, df):
        X = df['Text']
        y = df['Label']
        return train_test_split(X, y, test_size=0.33, random_state=42)

    def trainModel(self, fileName):
        df = pd.read_csv(fileName, encoding = "latin-1")
        X_train, X_test, y_train, y_test = self.trainTest(df)
        vectorizer = TfidfVectorizer()
        X_train_tfidf = vectorizer.fit_transform(X_train) #tfIDF and count_vectorizer
        clf = LinearSVC()
        clf.fit(X_train_tfidf, y_train)
        # adding model objects into pipeline
        text_clf = Pipeline([('tfidf', TfidfVectorizer()), ('clf', LinearSVC()),])
        # fitting data through pipeline
        text_clf.fit(X_train, y_train)
        self.model = text_clf

    def saveModel(self):
        pickle.dump(self.model, open('spam_model.sav', 'wb'))

    def openModel(self):
        return pickle.load(open('spam_model.sav', 'rb'))

    def predict(self, textStr):
        model = self.openModel()
        return model.predict([textStr])