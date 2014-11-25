namespace :assignments do
  desc "List all assignments"
  task list: :environment do
    Assignment.all.each do |assignment|
      p assignment
    end
  end

  desc "find bad data"
  task find: :environment do
    p Assignment.where.not(person_id: Person.all)
    p Assignment.where.not(location_id: Location.all)
  end

  desc "cleanup bad data"
  task cleanup: :environment do
    Assignment.where.not(person_id: Person.all).delete_all
    Assignment.where.not(location_id: Location.all).delete_all
  end
end
