class Event
    attr_reader :population, :group_size, :carriers

    def initialize(population:, carriers:, group_size:)
        @population = population
        @carriers = carriers
        @group_size = group_size
    end

    def risk
        # # https://marginalrevolution.com/marginalrevolution/2020/03/covid-19-event-risk-assessment-planner.html
        # # 1-(1-c/p)^g
        
        carriers_population_ratio = carriers.to_f / population
        factor = (1 - carriers_population_ratio) ** group_size
        (1 - factor).round(5)
    end
end
