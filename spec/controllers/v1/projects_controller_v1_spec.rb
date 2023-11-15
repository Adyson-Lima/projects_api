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

    describe "POST /api/v1/projects" do
      it "Consegue criar um project e retornar status 201?" do
        post :create, params: {project: {name: "laravel_ecommerce", tool: "laravel"}, format: :json}
        expect(response.body).to include_json(name: "laravel_ecommerce")
        expect(response).to have_http_status(201)
      end
    end

    describe "PATCH /api/v1/projects/id" do
      it "Consegue atualizar um project e retornar status 200?" do
        project = Project.last
        patch :update, params: {project: {name: "react_frontend", tool: "react"}, id: project.id}
        expect(response.body).to include_json(name: "react_frontend")
        expect(response).to have_http_status(200)
      end
    end

    describe "DELETE PATCH /api/v1/projects/id" do
      it "Consegue excluir um projeto e retornar status 204?" do
        project = Project.last
        delete :destroy, params: {id: project.id}
        expect(Project.all).not_to include(project)
        expect(response).to have_http_status(204)
      end
    end

end
