require 'rails_helper'

describe MoviesController, :type => :controller do
    describe 'same_director' do
        it 'should find a list of movies with the same director' do
            #write test here
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :director => 'James Cameron', :release_date => '17-Dec-1997'})

            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            expect(Movie).to receive(:where).with(:director => @movie.director).and_return(@movie)
            
            get :same_director, :id => @movie_id
            
        end
        it 'should redirect to the homepage if there is no director information' do
            #write test here
            @movie_id = '2'
            @movie = double({:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
            allow(@movie).to receive(:director)
            
            get :same_director, :id => @movie_id
            expect(response).to redirect_to(movies_path)
        end
    end
  
    describe "create" do
        it "creates a new movie" do
            movie = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            @movie = Movie.create!(movie)
            expect(@movie).to be_an_instance_of(Movie) # syntax taken from HangpersonGame
        end
    end
    
    describe "GET index" do
        it "renders the index template" do
            #movie1 = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            #@movie = Movie.create!(movie1)
            get :index
            expect(response).to render_template("index") # NO idea if this is right... got from online...
        end
    end
    
    describe "update" do
        it "changes a movie to the table" do
            #write test here
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie) 
            expect(@movie).to receive(:update_attributes!).with(:director => "James Cameron").and_return(:true)
            put :update, :id => @movie_id, :movie => {:director => "James Cameron"} 
            #expect(@movie.director).to eq("James Cameron")
            #expect(response).to redirect_to(movies_path)
        end
    end
    
    describe "destroy" do
        it "removes a movie from the table" do
            #write test here
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie) 
            expect(@movie).to receive(:destroy).and_return(:true)
            delete :destroy, :id => @movie_id
        end
    end
    
    
end