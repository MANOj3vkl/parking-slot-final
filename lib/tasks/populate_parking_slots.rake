namespace :populate_parking_slots do
  task create: :environment do
    entry_points = [
      { name: 'entry_point_1', start: 1, end: 250 },
      { name: 'entry_point_2', start: 251, end: 500 },
      { name: 'entry_point_3', start: 501, end: 750 },
      { name: 'entry_point_4', start: 751, end: 1000 }
    ]

    entry_points.each do |entry_point|
      entry_point_name = entry_point[:name]
      start_slot = entry_point[:start]
      end_slot = entry_point[:end]

      (start_slot..end_slot).each do |slot_number|
        ParkingSlot.create!(
          number: slot_number,
          entry_point: entry_point_name,
          status: 'available'
        )
      end
    end

    puts 'Parking slots have been created and assigned.'
  end
end
