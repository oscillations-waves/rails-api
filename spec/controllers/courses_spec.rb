require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  # initialize test data
  let!(:courses) { create_list(:course, 10) }
  let(:course_id) { courses.first.id }

  # Test suite for GET /courses
  describe 'GET /courses' do
    # make HTTP get request before each example
    before { get '/courses' }

    it 'returns courses' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /courses/:course_id
  describe 'GET /courses/:course_id' do
    before { get "/courses/#{course_id}" }

    context 'when the record exists' do
      it 'returns the course' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(course_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:course_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

    end
  end

  # Test suite for POST /courses
  describe 'POST /courses' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Ruby' } }

    context 'when the request is valid' do
      before { post '/courses', params: valid_attributes }

      it 'creates a course' do
        expect(json['name']).to eq('Learn Ruby')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

  end

  # Test suite for PUT /courses/:course_id
  describe 'PUT /courses/:course_id' do
    let(:valid_attributes) { { name: 'Learn Rails' } }

    context 'when the courses exists' do
      before { put "/courses/#{course_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /courses/:course_id
  describe 'DELETE /courses/:course_id' do
    before { delete "/courses/#{course_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end