document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")
  var options = {
    getValue: "name",
    url: function(phrase) {
      return "/trainer/courses.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "courses"
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url
        $input.val("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});
