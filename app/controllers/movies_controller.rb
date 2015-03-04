class MoviesController < ApplicationController
  def index

  end


def search
@movieresult = []

@movie = params[:movie]
request = Typhoeus::Request.new(
"http://www.omdbapi.com/?",
  method: :get,
  params: {s: @movie}
)
request.run


results = request.response.body
@movieresult = JSON.parse(results)
@movieresult = @movieresult["Search"]
 respond_to do |format|
    format.html # render .erb template as normal
    format.json {render :json => @movieresult}
end

end
end
