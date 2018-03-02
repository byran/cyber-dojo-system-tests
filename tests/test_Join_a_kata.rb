require_relative 'cyber_dojo_test'

class JoinAKataTest < CyberDojoTest

  def test_A_kata_can_be_joined_from_the_homepage
    create_and_enter_kata
    id = kata_id
    first_avatar = avatar
    assert_avatar(first_avatar)
    browser.restart

    navigate_to_the_join_page
    enter_kata_id(id[0..5])
    # without this sleep you get an exception
    # Selenium::WebDriver::Error::ElementNotVisibleError: element not visible
    # This is because the ok button is hidden until the id is entered.
    # TODO: find a better way to wait till the ok button is visible
    sleep 1

    ok_button.click
    switch_to_editor_window
    second_avatar = avatar
    assert_avatar(second_avatar)
    refute_equal first_avatar, second_avatar
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def navigate_to_the_join_page
    browser.navigate_home
    assert_page_loaded(pages.main)

    were_in_a_group_button.click
    assert_page_loaded(pages.group)

    join_button.click
    assert_page_loaded(pages.id_join_show)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def assert_avatar(name)
    assert avatar_names.include?(name)
  end

  # - - - - - - - - - - - - - - - - - - - - -

  def avatar_names
    %w(alligator antelope     bat       bear
       bee       beetle       buffalo   butterfly
       cheetah   crab         deer      dolphin
       eagle     elephant     flamingo  fox
       frog      gopher       gorilla   heron
       hippo     hummingbird  hyena     jellyfish
       kangaroo  kingfisher   koala     leopard
       lion      lizard       lobster   moose
       mouse     ostrich      owl       panda
       parrot    peacock      penguin   porcupine
       puffin    rabbit       raccoon   ray
       rhino     salmon       seal      shark
       skunk     snake        spider    squid
       squirrel  starfish     swan      tiger
       toucan    tuna         turtle    vulture
       walrus    whale        wolf      zebra
    )
  end

end