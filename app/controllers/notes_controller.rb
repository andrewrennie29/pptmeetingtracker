class NotesController < ApplicationController

  def new
    @note = Note.new
  end
  
  def create
    note=Note.new
  end

end
