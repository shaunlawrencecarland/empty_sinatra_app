RSpec.describe Event do
    context "#risk" do
        let(:event) do
            described_class.new(
                population: 8000000,
                carriers: 500,
                group_size: 1000
            )
        end

        it "returns 0.06059" do
            # https://marginalrevolution.com/marginalrevolution/2020/03/covid-19-event-risk-assessment-planner.html
            # https://www.wolframalpha.com/input/?i=p%3D8000000%2C+c%3D500%2C+g%3D1000%2C+1-%281-c%2Fp%29%5Eg+%2F%2FN
            expect(event.risk).to eq(0.06059)
        end
    end
end