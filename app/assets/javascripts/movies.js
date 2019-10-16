 $(function(){
  let url = window.location.search.split("=")
  let page = 1
  if (url[1]) {
    page = url[1]
  }
   $("document").ready(function(event){
      let rate;
       $.get("movies.json?page="+ page).success(function(json){
          for (var i = 0; i < json.length; i++) {
            console.log(json)
            $('#star-rating-'+ json[i].id).data("ids", json[i].id )
            $('#'+ json[i].id).raty({
              path: '/assets/',
              scoreName: 'rating'
            });
            $('#'+ json[i].id).click(function(e) {
                rate = this.children.rating.value;
                $.ajax({
                  type: "POST",
                  url: "/ratings",
                  data: {"rating" : {"rating": rate,"movie_id": this.id}},
                });
            });

            
          }
       });
       
   });
 });