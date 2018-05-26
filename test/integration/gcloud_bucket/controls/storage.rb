# frozen_string_literal: true

bucket_name = attribute "bucket_name", {}

control "bucket" do
  describe "bucket" do
    subject do
      command "gsutil ls -L -b gs://#{bucket_name}"
    end

    specify "should be an instance of the standard storage class" do
      expect(subject.stdout).to match /Storage class:.*STANDARD/
    end

    specify "should be versioned" do
      expect(subject.stdout).to match /Versioning enabled:.*True/
    end
  end
end
