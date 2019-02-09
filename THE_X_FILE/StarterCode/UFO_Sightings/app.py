import os

import pandas as pd
import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine
from sqlalchemy import func
from sqlalchemy import inspect

from flask import Flask, jsonify, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

#################################################
# Database Setup
#################################################

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///db/MUFON.sqlite"
db = SQLAlchemy(app)

###CHANGE to .sqlite, so save your database as an sqlite###
engine = create_engine("sqlite:///db/MUFON.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare (db.engine, reflect=True)

# Save references to each table
State_Metadata = Base.classes.UFO_ALL_data

#create session (link) from python to the db
session = Session(engine)

###Where does this belong?###
# Convert list of tuples into normal list
#all_states = list(np.ravel(results))

@app.route("/")
def index():
    """Return the homepage."""
    return render_template("index.html")

#State Route
@app.route("/states")
def states():
    """Return a list of state names."""

    # Query all states
    results = db.session.query(State_Metadata.State).all()
    #flatten the list from an array of arrays to a single list
    results = [r for (r, ) in results]
    return jsonify(results)

# #WordCloud Route
# @app.route("/wordcloud")
# def wordcloud():
#     """Return a list of most used words in the description for all"""
#     sel = [
#         State_Metadata.State,
#         State_Metadata.description
#     ]

#     results = session.query(*sel).all()
#     return jsonify(results)

#Sample WordCloud Route
@app.route("/wordcloud/<sample>")
def sample_wordcloud(sample):
    """Return a list of the most used words in the description for sample"""
    sel = [
        #State_Metadata.State,
        State_Metadata.description
    ]

    results = db.session.query(*sel).filter(State_Metadata.State == sample).all()
    return jsonify(results)

#Create a dictionary entry for each row of bar chart information
    sample_bar = {}
    for result in results:
        sample_wordcloud["sample"] = result[0]
        sample_wordcloud["description"] = result[1]
    
    print(sample_wordcloud)
    return jsonify(sample_wordcloud)        

# #BarChart Route
# @app.route("/bar")
# def bar():
#     """Return the monthly sightings for all."""
#     sel = [
#         State_Metadata.State,
#         State_Metadata.January,
#         State_Metadata.February,
#         State_Metadata.March,
#         State_Metadata.April,
#         State_Metadata.May,
#         State_Metadata.June,
#         State_Metadata.July,
#         State_Metadata.August,
#         State_Metadata.September,
#         State_Metadata.October,
#         State_Metadata.November,
#         State_Metadata.December
#     ]

#     results = session.query(*sel).all()
#     return jsonify(results)

#BarChart Sample Route
@app.route("/bar/<sample>")
def sample_bar(sample):
    """Return the monthly sightings for a given sample."""
    sel = [
        State_Metadata.State,
        State_Metadata.January,
        State_Metadata.February,
        State_Metadata.March,
        State_Metadata.April,
        State_Metadata.May,
        State_Metadata.June,
        State_Metadata.July,
        State_Metadata.August,
        State_Metadata.September,
        State_Metadata.October,
        State_Metadata.November,
        State_Metadata.December
    ]

    results = db.session.query(*sel).filter(State_Metadata.State == sample).all()
    
    #Create a dictionary entry for each row of bar chart information
    sample_bar = {}
    for result in results:
        #sample_bar["State"] = result[0]
        sample_bar["0January"] = result[1]
        sample_bar["1February"] = result[2]
        sample_bar["2March"] = result[3]
        sample_bar["3April"] = result[4]
        sample_bar["4May"] = result[5]
        sample_bar["5June"] = result[6]
        sample_bar["6July"] = result[7]
        sample_bar["7August"] = result[8]
        sample_bar["8September"] = result[9]
        sample_bar["9October"] = result[10]
        sample_bar["91November"] = result[11]
        sample_bar["92December"] = result[12]

    print(sample_bar)
    return jsonify(sample_bar)

# #Metadata Route
# @app.route("/table")
# def metadata():
#     """Return the MetaData for all."""
#     sel = [
#         State_Metadata.State,
#         State_Metadata.ABBREV,
#         State_Metadata.SIGHTINGS,
#         State_Metadata.Marijuana,
#         State_Metadata.BASES
#     ]

#     results = session.query(*sel).all()
#     return jsonify(results)

#Metadata Sample Route
@app.route("/table/<sample>")
def sample_metadata(sample):
    """Return the MetaData for a given sample."""
    sel = [
        State_Metadata.State,
        State_Metadata.SIGHTINGS,
        State_Metadata.Marijuana,
        State_Metadata.BASES,
    ]

    results = db.session.query(*sel).filter(State_Metadata.State == sample).all()
    
    #Create a dictionary entry for each row of metadata information
    sample_metadata = {}
    for result in results:
        sample_metadata["State"] = result[0]
        sample_metadata["SIGHTINGS"] = result[1]
        sample_metadata["Marijuana"] = result[2]
        sample_metadata["BASES"] = result[3]

    #print(sample_metadata)
    return jsonify(sample_metadata)


###TA SUGGESTED OPENING in DIFF PORTS EACH TIME
###WE RUN for ex: port=80xx:
#     app.run(port=8021)

if __name__ == "__main__":
    app.run()
