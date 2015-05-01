var initializeSearch = function() {
  var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
      var matches, substrRegex;
      matches = [];
      substrRegex = new RegExp(q, 'i');
      $.each(strs, function(i, str) {
        if (substrRegex.test(str)) {
          matches.push({ value: str });
        }
      });
      cb(matches);
    };
  };

  var setTypeAhead = function(suggestions) {
    $('.typeahead').typeahead({
      hint: false,
      highlight: true,
      minLength: 1
    },
    {
      displayKey: 'value',
      source: substringMatcher(suggestions)
    });
  }

  var getIssues = $.getJSON('/issues');
  getIssues.done(function(response){
    var issueNames;
    issueNames = response.map(function(data){
      return data.description;
    });
    setTypeAhead(issueNames);
  });

  var populatePositions = function(issue) {
    var positionsJSON = $.getJSON('/positions', { data: issue });

    positionsJSON.done(function(positions){
      var positionsContainer = $('#positions-container');
      positionContainer.empty();
      positions.forEach(function(position){
        var posString = '<p> class="position-description">' + position.description + '</p>';
        positionsContainer.append(posString);
      });
    });
  }

  $('.typeahead').bind('typeahead:selected', function() {
    var input = $(".tt-cursor").text()
    populatePositions(input);
  });
}

$(document).ready(function() {
  initializeSearch();
})