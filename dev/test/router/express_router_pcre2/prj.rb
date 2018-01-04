require 'mxx_ru/cpp'
MxxRu::Cpp::exe_target {

	if ENV.has_key?("RESTINIO_USES_BOOST_ASIO") and ENV["RESTINIO_USES_BOOST_ASIO"] == "1"
		# Add boost libs:
		lib_static( 'boost_system' )
	else
		required_prj 'asio_mxxru/prj.rb'
	end

	required_prj 'nodejs/http_parser_mxxru/prj.rb'
	required_prj 'fmt_mxxru/prj.rb'
	required_prj 'restinio/platform_specific_libs.rb'

	required_prj 'restinio/pcre2_libs.rb'

	target( "_unit.test.router.express_router_pcre2" )

	cpp_source( "main.cpp" )
}

