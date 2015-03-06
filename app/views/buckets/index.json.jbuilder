json.array!(@buckets) do |bucket|
  json.extract! bucket, :id, :name, :description
  json.url bucket_url(bucket, format: :json)
end
