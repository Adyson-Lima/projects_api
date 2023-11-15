require "rails_helper"

RSpec.describe Api::V1::ProjectsController, type: :controller do

    before{ @project = Project.create(name: "angular_frontend", tool: "angular") }

    describe "GET /api/v1/projects" do
      it "Consegue listar todos os projects e retornar status 200?" do
        get :index
        expect(JSON.parse(response.body).size).to eq(1)
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /api/v1/projects/id" do
      it "Consegue listar um project especifico e retornar status 200?" do
        get :show, params: {id: @project.id}
          expect(response.body).to include_json(id: @project.id)
          expect(response).to have_http_status(200)
      end
    end

end
