module CommentHelpers

  def leaving_a_comment
    visit '/pictures'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: 'whatever'
    click_button 'Leave Comment'
  end
end
