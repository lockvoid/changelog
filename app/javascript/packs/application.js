import '../initializers/feather';
import '../initializers/stimulus';
import '../initializers/rails';
import '../initializers/helpers';
import './application.css';

require.context('../../views', true, /.css$/);
