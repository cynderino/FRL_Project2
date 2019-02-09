console.log("WTF is happening?")

function buildMetadata(sample) {
  var url = `/table/${sample}`; //this url says, "look here for ___ sample state"
  console.log(url);

  // @TODO: Complete the following function that builds the metadata panel

  // Use `d3.json` to fetch the metadata for a sample
  d3.json(url).then(function(response) { //give me the jsonified data for the url above
    console.log(response);

    var metaData = [response];
    console.log(metaData);

    // Use d3 to select the panel with id of `#sample-metadata`
    samplePanel = d3.select("#sample-metadata")
    // Use `.html("") to clear any existing metadata
    samplePanel.html(""); //replace the last displayed data before putting in new data below.

    // Use `Object.entries` to add each key and value pair to the panel
    // Hint: Inside the loop, you will need to use d3 to append new
    // tags for each key-value in the metadata.
    metaData.forEach((selectSample) => {

      Object.entries(selectSample).forEach(([key, value]) => {
        var row = samplePanel.append("tr");
        row.text(key + ": " + value);
    })
  })
})
}

   


function buildCharts(sample) {
var graphUrl = `/bar/${sample}`; //this url says, "look here for ___ sample number"
  console.log(graphUrl);

var stringUrl = `/wordcloud/${sample}`;
console.log(stringUrl)

// @TODO: Use `d3.json` to fetch the sample data for the plots
d3.json(graphUrl).then(function(response) { //give me the jsonified data for the url above
  console.log(response);

  var sightings = response;
  console.log(sightings);

  var crap = Object.values(sightings); 
  console.log(crap);

  months = ["January 2018", "February 2018", "March 2018", "April 2018", "May 2018", "June 2018", "July 2018", "August 2018", "September 2018", "October 2018", "November 2018", "December 2018"];

  // @TODO: Build a bar Chart using the sample data
  var trace1 = {
    x: months,
    y: crap,
    type: 'bar',
    };

  var barTrace = [trace1]
  var layout = {
    xaxis: {
      title: {
        text:"Month"}
      },
    yaxis: {
      title: {
        text:"Number of Sightings"}
      },
    title: "Total Sightings by Month",
    
    };

  Plotly.newPlot("bar", barTrace, layout);

  // @TODO: Build the Wordcloud
  d3.json(stringUrl).then(function(response) { //give me the jsonified data for the url above
    console.log(response);

    var words = response

    var myConfig = {
      type: 'wordcloud',
      options: {
        text: `"${words}"`,
        minLength: 3,
        ignore: ["Because","because","could","don’t","That’s","that’s","Their","their","there","these","thing","those","through","We’re","we’re","where","would", "the", "was", "cak", "jpg", "and", "like", "rjl", "that", "from", "over", "went", "before", "started", "saw", "with", "over", "towards", "very", "into", "but", "tjd", "into", "this", "around", "for", "looked", "Was", "not", "for", "then", "out", "off", "Saw", "Then", "when", "than", "were","had", "It's", "it's", "its", "And", "them", "did", "were", "just", "seen", "other", "them", ],
        maxItems: 40,
        aspect: 'flow-center',
        rotate: true,
        colorType: 'palette',
        palette: ['#2ECC71','#3498DB' ,'#8E44AD','#117864','#C39BD3','#4A235A','#F44336','#7FB3D5','#2196F3','#2E4053','#F7DC6F','#2980B9'],
        
        style: {
          fontFamily: 'Crete Round',
          
          hoverState: {
            backgroundColor: '#D32F2F',
            borderRadius: 2,
            fontColor: 'white'
          },
          tooltip: {
            text: '%text: %hits',
            visible: true,
            
            alpha: 0.9,
            backgroundColor: '#1976D2',
            borderRadius: 2,
            borderColor: 'none',
            fontColor: 'white',
            fontFamily: 'Georgia',
            textAlpha: 1
          }
        }
      },
      
      source: {
        text: 'descriptions of UFO encounters from 2018',
        //Source: https:https://www.mufon.com/track-ufos.html
        fontColor: '#64B5F6',
        fontSize: 10,
        fontFamily: 'Georgia',
        fontWeight: 'normal',
        marginBottom: '10%'
      }
    };
    
    zingchart.render({ 
      id: 'wordcloud', 
      data: myConfig, 
      height: 400, 
      width: '100%' 
    });

  })

  
});

}

function init() {
// Grab a reference to the dropdown select element
var selector = d3.select("#selDataset");

// Use the list of sample names to populate the select options
d3.json("/states").then((sampleNames) => {
  sampleNames.forEach((sample) => {
    selector
      .append("option")
      .text(sample)
      .property("value", sample);
  });

  

  // Use the first sample from the list to build the initial plots
  const firstSample = sampleNames[0];
  buildCharts(firstSample);
  buildMetadata(firstSample);
});
}

function optionChanged(newSample) {
// Fetch new data each time a new sample is selected
buildCharts(newSample);
buildMetadata(newSample);
}

// Initialize the dashboard
init();
