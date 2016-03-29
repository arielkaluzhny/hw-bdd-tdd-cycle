require 'rails_helper'
#require 'movies_controller'

describe MoviesController do
    describe 'same_director' do
        it 'should find a list of movies with the same director' do
            #write test here
=begin
            movie1 = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            movie2 = {:title => 'Titanic', :rating => 'PG-13', :director => 'James Cameron', :release_date => '17-Dec-1997'}
            movie3 = {:title => 'Avatar', :rating => 'PG-13', :director => 'James Cameron', :release_date => '18-Dec-2009'}
            
            @movie1 = Movie.create!(movie1)
            @movie2 = Movie.create!(movie2)
            @movie2 = Movie.create!(movie2)
=end
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :director => 'James Cameron', :release_date => '17-Dec-1997'})

            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(Movie).to receive(:where).with(@movie.director).and_return(@movie)
            
            get :same_director, :id => @movie_id
            
        end
        it 'should redirect to the homepage if there is no director information' do
            #write test here
            
        end
    end
=begin    
    describe "create" do
        it "creates a new movie"
            movie = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            @movie = Movie.create!(movie1)
            expect(@movie).to be_an_instance_of(Movie) # syntax taken from HangpersonGame
    end
    
    describe "GET index" do
        it "renders the index template" do
            movie1 = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            @movie = Movie.create!(movie1)
            get :index
            expect(response).to render_template("index") # NO idea if this is right... got from online...
    end
  end
=end
end