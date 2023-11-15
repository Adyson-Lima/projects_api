require "rails_helper"

RSpec.describe Project, type: :model do

    before {@project = Project.new}

    describe "Teste de preenchimento dos campos do model Project" do

        it "name consegue ser preenchido?" do
            @project.name = ""
            expect(@project.name).to eq("api rails")
        end

    end
end
