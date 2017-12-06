require 'fileutils'

module Rho
  module DebRep
    def foo
      puts ">>> DEBREP"
      "DEBUG REPORT TEST"
    end
    module_function :foo    

    def prepareReport( userData = {} )
    	repdir = File.join( Rho::Application.userFolder, "depbrep-tmp-#{Time.now.to_i}" )
    	FileUtils.mkdir_p repdir
    	FileUtils.cp Rho::Log.filePath, repdir

#	File.write( File.join( repdir, 'app.props.json' ), JSON.generate( Rho::Application.getAllProperties ) )
	File.write( File.join( repdir, 'sys.props.json' ), JSON.generate( Rho::System.getAllProperties ) )

    	tozip = Dir.glob( File.join(repdir,'*') )
    	Rho::System.zipFiles( "#{repdir}.zip", repdir, tozip )
    	FileUtils.rm_r repdir
    end
    module_function :prepareReport
  end
end
