require 'rails_helper'

RSpec.describe Task, type: :model do

  context 'validations' do
    describe 'factory' do
      it 'is valid' do
        task = FactoryBot.build :task
        expect(task).to be_valid
      end
    end

    describe 'validation presence true' do
      it { should validate_presence_of :task_name }
      it { should validate_presence_of :user_id }
    end
  end

  context 'associations' do
    describe 'are valid' do
      it { should belong_to(:parent_task) }
      it { should belong_to(:user) }
      it { should have_many(:sub_tasks) }
    end
  end

  describe '#private_task?' do
    context "call private_task? for public task" do
      let(:public_task) { FactoryBot.build :public_task }
      it "should return false" do
        expect(public_task.private_task?).to eq false
      end
    end

    context "call private_task? for private task" do
      let(:private_task) { FactoryBot.build :task }
      it "should return true" do
        expect(private_task.private_task?).to eq true
      end
    end
  end

end
