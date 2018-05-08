# frozen_string_literal: true

control "bucket" do
  describe command('gsutil ls') do
    its('stdout') { should match (/gs:\/\/test-org-state-bucket\//) }
  end

  describe command('gsutil ls -L -b gs://test-org-state-bucket') do
    its('stdout') { should match (/Storage class:.*STANDARD/) }
    its('stdout') { should match (/Versioning enabled:.*True/) }
  end
end
