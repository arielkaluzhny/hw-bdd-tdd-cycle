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
            expect(flash[:notice]).to be_present
        end
    end
  
    describe "create" do
        it "creates a new movie" do
            movie = {:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'}
            @movie = Movie.create!(movie)
            expect(@movie).to be_an_instance_of(Movie) # syntax taken from HangpersonGame
            #expect(flash[:notice]).to be_present
        end
    end
    
    describe "GET index" do
        it "renders the index template" do
            get :index
            expect(response).to render_template("index") # NO idea if this is right... got from online...
        end
=begin
        it "should have movies with rating in correct order" do
                    #    @movies = Movie.where(rating: @selected_ratings.keys).order(ordering)
            @ordering = {:release_date => :asc}
            @rating = 'PG-13'
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:where).with(:rating => @rating)
            expect(Movie).to receive(:order).with(@ordering)
        end
=end
    end
    
    describe "update" do
        it "changes a movie to the table" do
            #write test here
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie) 
            expect(@movie).to receive(:update_attributes!).with(:director => "James Cameron").and_return(:true)
            
            put :update, :id => @movie_id, :movie => {:director => "James Cameron"} 
            expect(flash[:notice]).to be_present
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
            expect(flash[:notice]).to be_present
        end
    end
    
    describe "show" do
        it "shows the details page for a movie" do
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie) 
            
            get :show, :id => @movie_id
            expect(response).to render_template("show")
        end
    end
    
    describe "edit" do
        it "brings up edit page for a movie" do
            @movie_id = '1'
            @movie = double({:title => 'Titanic', :rating => 'PG-13', :release_date => '17-Dec-1997'})
            expect(Movie).to receive(:find).with(@movie_id).and_return(@movie) 
            
            get :edit, :id => @movie_id
            expect(response).to render_template("edit")
        end
    end
    
    describe "new" do
        it "brings up a template for a new movie" do
            get :new
            expect(response).to render_template("new")
        end
    end
    
end