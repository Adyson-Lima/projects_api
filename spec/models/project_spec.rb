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
end
