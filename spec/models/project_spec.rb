require "rails_helper"

RSpec.describe Project, type: :model do

    before {@project = Project.new}

    describe "Teste de preenchimento dos campos do model Project" do

        it "name consegue ser preenchido?" do
            @project.name = "api rails"
            expect(@project.name).to eq("api rails")
        end

        it "tool consegue ser preenchido?" do
            @project.tool = "rails"
            expect(@project.tool).to eq("rails")
        end

    end

    describe "Teste de validação do model Project" do

        it "Project valido com campos obrigatorios preenchidos?" do
            @project.name ="react_frontend"
            @project.tool = "react"
            expect(@project).to be_valid
        end

        it "Project invalido com campos obrigatorios não preenchidos?" do
            project = Project.new
            expect(project).to be_invalid
        end
    end
end
