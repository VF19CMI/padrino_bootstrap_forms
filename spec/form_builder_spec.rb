require "spec_helper"

shared_examples "form builder fields" do
  it "renders the field" do
    req(format, view).should eq control_group(name, field)
  end

  #[:help_inline, :help_block, :prepend, :append, :error, :succes, :warning, :info].each do |option|
  [:help_inline, :help_block, :error, :append].each do |option|
    it "renders the field with the :#{option} option" do
      req(format, "#{view}_with_#{option}").should eq control_group(name, field, option => option.to_s.titleize)
    end
  end
end

describe BootstrapForms::FormBuilder do
  let(:name) { :name }  

  [:email, :file, :number, :password, :phone, :search, :text, :url].each do |type|
    describe "#{type}_field" do
      let(:view)  { "#{type}_field" }
      let(:field) { Hash[:type => type, :value => "sshaw"] }

      context "using erb" do
        include_examples "form builder fields"
        let(:format) { :erb }
      end

      # context "using slim" do
      #   include_examples "form builder fields"
      #   let(:format) { :slim }
      # end

      # context "using haml" do
      #   include_examples "form builder fields"
      #   let(:format) { :haml }
      # end
    end
  end

  describe "#select" do
    let(:view)  { "select_field" }
    let(:field) { select_tag("item[name]", :options => %w[sshaw fofinha], :selected => "sshaw", :id => "item_name") }
    
    context "using erb" do
      include_examples "form builder fields"      
      let(:format) { :erb }
    end
  end
end
