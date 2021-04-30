" if exists('b:current_syntax') && b:current_syntax == 'php.wordpress'
" 	finish
" elseif !exists('b:wordpress_buffer')
" 	finish
" elseif exists('g:wordpress_vim_php_syntax_highlight') && !g:wordpress_vim_php_syntax_highlight
" 	finish
" end

" from:
" https://github.com/WordPress/WordPress/tree/master/wp-includes

" wp-includes/admin-bar.php
syntax keyword wpFunction _wp_admin_bar_init contained
syntax keyword wpFunction wp_admin_bar_render contained
syntax keyword wpFunction wp_admin_bar_wp_menu contained
syntax keyword wpFunction wp_admin_bar_sidebar_toggle contained
syntax keyword wpFunction wp_admin_bar_my_account_item contained
syntax keyword wpFunction wp_admin_bar_my_account_menu contained
syntax keyword wpFunction wp_admin_bar_site_menu contained
syntax keyword wpFunction wp_admin_bar_customize_menu contained
syntax keyword wpFunction wp_admin_bar_my_sites_menu contained
syntax keyword wpFunction wp_admin_bar_shortlink_menu contained
syntax keyword wpFunction wp_admin_bar_edit_menu contained
syntax keyword wpFunction wp_admin_bar_new_content_menu contained
syntax keyword wpFunction wp_admin_bar_comments_menu contained
syntax keyword wpFunction wp_admin_bar_appearance_menu contained
syntax keyword wpFunction wp_admin_bar_updates_menu contained
syntax keyword wpFunction wp_admin_bar_search_menu contained
syntax keyword wpFunction wp_admin_bar_recovery_mode_menu contained
syntax keyword wpFunction wp_admin_bar_add_secondary_groups contained
syntax keyword wpFunction wp_admin_bar_header contained
syntax keyword wpFunction _admin_bar_bump_cb contained
syntax keyword wpFunction show_admin_bar contained
syntax keyword wpFunction is_admin_bar_showing contained
syntax keyword wpFunction _get_admin_bar_pref contained

" wp-includes/atomlib.php
syntax keyword wpClass AtomFeed contained
syntax keyword wpClass AtomEntry contained
syntax keyword wpClass AtomParser contained
syntax keyword wpFunction __construct contained
syntax keyword wpFunction AtomParser contained
syntax keyword wpFunction map_attrs contained
syntax keyword wpFunction map_xmlns contained
syntax keyword wpFunction _p contained
syntax keyword wpFunction error_handler contained
syntax keyword wpFunction parse contained
syntax keyword wpFunction start_element contained
syntax keyword wpFunction end_element contained
syntax keyword wpFunction start_ns contained
syntax keyword wpFunction end_ns contained
syntax keyword wpFunction cdata contained
syntax keyword wpFunction _default contained
syntax keyword wpFunction ns_to_prefix contained
syntax keyword wpFunction is_declared_content_ns contained
syntax keyword wpFunction xml_escape contained

" wp-includes/author-template.php
syntax keyword wpFunction get_the_author contained
syntax keyword wpFunction the_author contained
syntax keyword wpFunction get_the_modified_author contained
syntax keyword wpFunction the_modified_author contained
syntax keyword wpFunction get_the_author_meta contained
syntax keyword wpFunction the_author_meta contained
syntax keyword wpFunction get_the_author_link contained
syntax keyword wpFunction the_author_link contained
syntax keyword wpFunction get_the_author_posts contained
syntax keyword wpFunction the_author_posts contained
syntax keyword wpFunction get_the_author_posts_link contained
syntax keyword wpFunction the_author_posts_link contained
syntax keyword wpFunction get_author_posts_url contained
syntax keyword wpFunction wp_list_authors contained
syntax keyword wpFunction is_multi_author contained
syntax keyword wpFunction __clear_multi_author_cache contained

" wp-includes/block-editor.php
syntax keyword wpFunction get_default_block_categories contained
syntax keyword wpFunction get_block_categories contained
syntax keyword wpFunction get_allowed_block_types contained
syntax keyword wpFunction get_default_block_editor_settings contained
syntax keyword wpFunction get_block_editor_settings contained

" wp-includes/block-patterns.php
syntax keyword wpFunction _register_core_block_patterns_and_categories contained

" wp-includes/blocks.php
syntax keyword wpFunction register_block_type contained
syntax keyword wpFunction unregister_block_type contained
syntax keyword wpFunction remove_block_asset_path_prefix contained
syntax keyword wpFunction generate_block_asset_handle contained
syntax keyword wpFunction register_block_script_handle contained
syntax keyword wpFunction register_block_style_handle contained
syntax keyword wpFunction register_block_type_from_metadata contained
syntax keyword wpFunction has_blocks contained
syntax keyword wpFunction has_block contained
syntax keyword wpFunction get_dynamic_block_names contained
syntax keyword wpFunction serialize_block_attributes contained
syntax keyword wpFunction strip_core_block_namespace contained
syntax keyword wpFunction get_comment_delimited_block_content contained
syntax keyword wpFunction serialize_block contained
syntax keyword wpFunction serialize_blocks contained
syntax keyword wpFunction filter_block_content contained
syntax keyword wpFunction filter_block_kses contained
syntax keyword wpFunction filter_block_kses_value contained
syntax keyword wpFunction excerpt_remove_blocks contained
syntax keyword wpFunction _excerpt_render_inner_columns_blocks contained
syntax keyword wpFunction render_block contained
syntax keyword wpFunction parse_blocks contained
syntax keyword wpFunction do_blocks contained
syntax keyword wpFunction _restore_wpautop_hook contained
syntax keyword wpFunction block_version contained
syntax keyword wpFunction register_block_style contained
syntax keyword wpFunction unregister_block_style contained
syntax keyword wpFunction block_has_support contained

" wp-includes/bookmark-template.php
syntax keyword wpFunction _walk_bookmarks contained
syntax keyword wpFunction wp_list_bookmarks contained

" wp-includes/bookmark.php
syntax keyword wpFunction get_bookmark contained
syntax keyword wpFunction get_bookmark_field contained
syntax keyword wpFunction get_bookmarks contained
syntax keyword wpFunction sanitize_bookmark contained
syntax keyword wpFunction sanitize_bookmark_field contained
syntax keyword wpFunction clean_bookmark_cache contained

" wp-includes/cache-compat.php
syntax keyword wpFunction wp_cache_get_multiple contained

" wp-includes/cache.php
syntax keyword wpFunction wp_cache_add contained
syntax keyword wpFunction wp_cache_close contained
syntax keyword wpFunction wp_cache_decr contained
syntax keyword wpFunction wp_cache_delete contained
syntax keyword wpFunction wp_cache_flush contained
syntax keyword wpFunction wp_cache_get contained
syntax keyword wpFunction wp_cache_get_multiple contained
syntax keyword wpFunction wp_cache_incr contained
syntax keyword wpFunction wp_cache_init contained
syntax keyword wpFunction wp_cache_replace contained
syntax keyword wpFunction wp_cache_set contained
syntax keyword wpFunction wp_cache_switch_to_blog contained
syntax keyword wpFunction wp_cache_add_global_groups contained
syntax keyword wpFunction wp_cache_add_non_persistent_groups contained
syntax keyword wpFunction wp_cache_reset contained

" wp-includes/canonical.php
syntax keyword wpFunction redirect_canonical contained
syntax keyword wpFunction _remove_qs_args_if_not_in_url contained
syntax keyword wpFunction strip_fragment_from_url contained
syntax keyword wpFunction redirect_guess_404_permalink contained
syntax keyword wpFunction wp_redirect_admin_locations contained

" wp-includes/capabilities.php
syntax keyword wpFunction map_meta_cap contained
syntax keyword wpFunction current_user_can contained
syntax keyword wpFunction current_user_can_for_blog contained
syntax keyword wpFunction author_can contained
syntax keyword wpFunction user_can contained
syntax keyword wpFunction wp_roles contained
syntax keyword wpFunction get_role contained
syntax keyword wpFunction add_role contained
syntax keyword wpFunction remove_role contained
syntax keyword wpFunction get_super_admins contained
syntax keyword wpFunction is_super_admin contained
syntax keyword wpFunction grant_super_admin contained
syntax keyword wpFunction revoke_super_admin contained
syntax keyword wpFunction wp_maybe_grant_install_languages_cap contained
syntax keyword wpFunction wp_maybe_grant_resume_extensions_caps contained
syntax keyword wpFunction wp_maybe_grant_site_health_caps contained

" wp-includes/category-template.php
syntax keyword wpFunction get_category_link contained
syntax keyword wpFunction get_category_parents contained
syntax keyword wpFunction get_the_category contained
syntax keyword wpFunction get_the_category_by_ID contained
syntax keyword wpFunction get_the_category_list contained
syntax keyword wpFunction in_category contained
syntax keyword wpFunction the_category contained
syntax keyword wpFunction category_description contained
syntax keyword wpFunction wp_dropdown_categories contained
syntax keyword wpFunction wp_list_categories contained
syntax keyword wpFunction wp_tag_cloud contained
syntax keyword wpFunction default_topic_count_scale contained
syntax keyword wpFunction wp_generate_tag_cloud contained
syntax keyword wpFunction _wp_object_name_sort_cb contained
syntax keyword wpFunction _wp_object_count_sort_cb contained
syntax keyword wpFunction walk_category_tree contained
syntax keyword wpFunction walk_category_dropdown_tree contained
syntax keyword wpFunction get_tag_link contained
syntax keyword wpFunction get_the_tags contained
syntax keyword wpFunction get_the_tag_list contained
syntax keyword wpFunction the_tags contained
syntax keyword wpFunction tag_description contained
syntax keyword wpFunction term_description contained
syntax keyword wpFunction get_the_terms contained
syntax keyword wpFunction get_the_term_list contained
syntax keyword wpFunction get_term_parents_list contained
syntax keyword wpFunction the_terms contained
syntax keyword wpFunction has_category contained
syntax keyword wpFunction has_tag contained
syntax keyword wpFunction has_term contained

" wp-includes/category.php
syntax keyword wpFunction get_categories contained
syntax keyword wpFunction get_category contained
syntax keyword wpFunction get_category_by_path contained
syntax keyword wpFunction get_category_by_slug contained
syntax keyword wpFunction get_cat_ID contained
syntax keyword wpFunction get_cat_name contained
syntax keyword wpFunction cat_is_ancestor_of contained
syntax keyword wpFunction sanitize_category contained
syntax keyword wpFunction sanitize_category_field contained
syntax keyword wpFunction get_tags contained
syntax keyword wpFunction get_tag contained
syntax keyword wpFunction clean_category_cache contained
syntax keyword wpFunction _make_cat_compat contained

" wp-includes/class-http.php
syntax keyword wpClass WP_Http contained
syntax keyword wpFunction request contained
syntax keyword wpFunction normalize_cookies contained
syntax keyword wpFunction browser_redirect_compatibility contained
syntax keyword wpFunction validate_redirects contained
syntax keyword wpFunction _get_first_available_transport contained
syntax keyword wpFunction _dispatch_request contained
syntax keyword wpFunction post contained
syntax keyword wpFunction get contained
syntax keyword wpFunction head contained
syntax keyword wpFunction processResponse contained
syntax keyword wpFunction processHeaders contained
syntax keyword wpFunction buildCookieHeader contained
syntax keyword wpFunction chunkTransferDecode contained
syntax keyword wpFunction block_request contained
syntax keyword wpFunction parse_url contained
syntax keyword wpFunction make_absolute_url contained
syntax keyword wpFunction handle_redirects contained
syntax keyword wpFunction is_ip_address contained

" wp-includes/class-json.php
syntax keyword wpClass Services_JSON contained
syntax keyword wpClass Services_JSON_Error contained
syntax keyword wpFunction __construct contained
syntax keyword wpFunction Services_JSON contained
syntax keyword wpFunction utf162utf8 contained
syntax keyword wpFunction utf82utf16 contained
syntax keyword wpFunction encode contained
syntax keyword wpFunction encodeUnsafe contained
syntax keyword wpFunction _encode contained
syntax keyword wpFunction name_value contained
syntax keyword wpFunction reduce_string contained
syntax keyword wpFunction decode contained
syntax keyword wpFunction isError contained
syntax keyword wpFunction strlen8 contained
syntax keyword wpFunction substr8 contained
syntax keyword wpFunction __construct contained
syntax keyword wpFunction Services_JSON_Error contained

" wp-includes/class-phpass.php
syntax keyword wpClass PasswordHash contained
syntax keyword wpFunction __construct contained
syntax keyword wpFunction PasswordHash contained
syntax keyword wpFunction get_random_bytes contained
syntax keyword wpFunction encode64 contained
syntax keyword wpFunction gensalt_private contained
syntax keyword wpFunction crypt_private contained
syntax keyword wpFunction gensalt_extended contained
syntax keyword wpFunction gensalt_blowfish contained
syntax keyword wpFunction HashPassword contained
syntax keyword wpFunction CheckPassword contained

" wp-includes/class-pop3.php
syntax keyword wpClass POP3 contained
syntax keyword wpFunction __construct contained
syntax keyword wpFunction POP3 contained
syntax keyword wpFunction update_timer contained
syntax keyword wpFunction connect contained
syntax keyword wpFunction user contained
syntax keyword wpFunction pass contained
syntax keyword wpFunction apop contained
syntax keyword wpFunction login contained
syntax keyword wpFunction top contained
syntax keyword wpFunction pop_list contained
syntax keyword wpFunction get contained
syntax keyword wpFunction last contained
syntax keyword wpFunction reset contained
syntax keyword wpFunction send_cmd contained
syntax keyword wpFunction quit contained
syntax keyword wpFunction popstat contained
syntax keyword wpFunction uidl contained
syntax keyword wpFunction delete contained
syntax keyword wpFunction is_ok contained
syntax keyword wpFunction strip_clf contained
syntax keyword wpFunction parse_banner contained

" wp-includes/*.php
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained
syntax keyword wpFunction contained

highlight def link wpFunction Function
highlight def link wpClass StorageClass
highlight def link wpDeprecated Error
highlight def link wpConstant Constant
