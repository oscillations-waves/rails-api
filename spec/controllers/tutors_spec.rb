require 'rails_helper'

RSpec.describe 'Tutors API' do
  # Initialize the test data
  let!(:course) { create(:course) }
  let!(:tutors) { create_list(:tutor_name, course_id: course.id) }
  let(:course_id) { course.id }
  let(:id) { tutors.first.id }

  # Test suite for GET /courses/:course_id/tutors
  describe 'GET /courses/:course_id/tutors' do
    before { get "/courses/#{course_id}/tutors" }

    context 'when course exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all courses' do
        expect(json.size).to eq(20)
      end
    end

    context 'when course does not exist' do
      let(:course_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for GET /courses/:course_id/tutors/:id
  describe 'GET /courses/:course_id/tutors/:id' do
    before { get "/courses/#{course_id}/tutors/#{id}" }

    context 'when tutor exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the tutor information' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when tutor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for PUT /courses/:course_id/tutors
  describe 'POST /courses/:course_id/tutors' do
    let(:valid_attributes) { { tutor_name: 'Harry Potter' } }

    context 'when request attributes are valid' do
      before { post "/courses/#{course_id}/tutors"}

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/courses/#{course_id}/tutors", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

    end
  end

  # Test suite for PUT /courses/:course_id/tutors
  describe 'PUT  /courses/:course_id/tutors' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/courses/#{course_id}/tutors/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_tutor = Tutor.find(id)
        expect(updated_tutor.tutor_anme).to match(/Mozart/)
      end
    end

    context 'when the tutor does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

    end
  end

  # Test suite for DELETE /courses/:course_id
  describe 'DELETE /courses/:course_id' do
    before { delete "/courses/#{course_id}/items/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end