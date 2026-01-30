/// Enum representing all available Sxnnyside Eloquent Icons.
///
/// Each enum value corresponds to an SVG file in the assets directory.
enum SeiIcon {
  account,
  add,
  alert,
  analytics,
  api,
  app,
  apps,
  back,
  backup,
  badge,
  brackets,
  browser,
  bug,
  build,
  calendar,
  chartBar,
  chartLine,
  chartPie,
  check,
  checklist,
  clock,
  close,
  cloud,
  code,
  connection,
  cpu,
  creditCard,
  crown,
  dashboard,
  database,
  debug,
  deploy,
  discount,
  download,
  edit,
  error,
  exploit,
  file,
  filter,
  fingerprint,
  firewall,
  flame,
  focus,
  folder,
  function,
  gamepad,
  globe,
  heart,
  help,
  home,
  info,
  install,
  invite,
  invoice,
  joystick,
  key,
  layoutGrid,
  layoutList,
  linkExternal,
  link,
  lockOpen,
  lock,
  log,
  login,
  logout,
  menu,
  message,
  money,
  more,
  music,
  mute,
  notification,
  offline,
  package,
  plugin,
  power,
  pricing,
  profile,
  progress,
  qr,
  receipt,
  refresh,
  register,
  remove,
  restore,
  router,
  scan,
  search,
  server,
  settings,
  share,
  shield,
  skull,
  sort,
  sound,
  spark,
  star,
  subscription,
  success,
  sync,
  tab,
  task,
  team,
  terminal,
  timer,
  uninstall,
  unlock,
  update,
  upload,
  user,
  users,
  variable,
  verified,
  version,
  visibilityOff,
  visibility,
  wallet,
  warning,
  wifi,
  window,
}

/// Extension to convert [SeiIcon] enum values to their corresponding
/// SVG filename.
extension SeiIconExtension on SeiIcon {
  /// Returns the SVG filename for this icon (without path or extension).
  String get fileName {
    switch (this) {
      case SeiIcon.account:
        return 'account';
      case SeiIcon.add:
        return 'add';
      case SeiIcon.alert:
        return 'alert';
      case SeiIcon.analytics:
        return 'analytics';
      case SeiIcon.api:
        return 'api';
      case SeiIcon.app:
        return 'app';
      case SeiIcon.apps:
        return 'apps';
      case SeiIcon.back:
        return 'back';
      case SeiIcon.backup:
        return 'backup';
      case SeiIcon.badge:
        return 'badge';
      case SeiIcon.brackets:
        return 'brackets';
      case SeiIcon.browser:
        return 'browser';
      case SeiIcon.bug:
        return 'bug';
      case SeiIcon.build:
        return 'build';
      case SeiIcon.calendar:
        return 'calendar';
      case SeiIcon.chartBar:
        return 'chart-bar';
      case SeiIcon.chartLine:
        return 'chart-line';
      case SeiIcon.chartPie:
        return 'chart-pie';
      case SeiIcon.check:
        return 'check';
      case SeiIcon.checklist:
        return 'checklist';
      case SeiIcon.clock:
        return 'clock';
      case SeiIcon.close:
        return 'close';
      case SeiIcon.cloud:
        return 'cloud';
      case SeiIcon.code:
        return 'code';
      case SeiIcon.connection:
        return 'connection';
      case SeiIcon.cpu:
        return 'cpu';
      case SeiIcon.creditCard:
        return 'credit-card';
      case SeiIcon.crown:
        return 'crown';
      case SeiIcon.dashboard:
        return 'dashboard';
      case SeiIcon.database:
        return 'database';
      case SeiIcon.debug:
        return 'debug';
      case SeiIcon.deploy:
        return 'deploy';
      case SeiIcon.discount:
        return 'discount';
      case SeiIcon.download:
        return 'download';
      case SeiIcon.edit:
        return 'edit';
      case SeiIcon.error:
        return 'error';
      case SeiIcon.exploit:
        return 'exploit';
      case SeiIcon.file:
        return 'file';
      case SeiIcon.filter:
        return 'filter';
      case SeiIcon.fingerprint:
        return 'fingerprint';
      case SeiIcon.firewall:
        return 'firewall';
      case SeiIcon.flame:
        return 'flame';
      case SeiIcon.focus:
        return 'focus';
      case SeiIcon.folder:
        return 'folder';
      case SeiIcon.function:
        return 'function';
      case SeiIcon.gamepad:
        return 'gamepad';
      case SeiIcon.globe:
        return 'globe';
      case SeiIcon.heart:
        return 'heart';
      case SeiIcon.help:
        return 'help';
      case SeiIcon.home:
        return 'home';
      case SeiIcon.info:
        return 'info';
      case SeiIcon.install:
        return 'install';
      case SeiIcon.invite:
        return 'invite';
      case SeiIcon.invoice:
        return 'invoice';
      case SeiIcon.joystick:
        return 'joystick';
      case SeiIcon.key:
        return 'key';
      case SeiIcon.layoutGrid:
        return 'layout-grid';
      case SeiIcon.layoutList:
        return 'layout-list';
      case SeiIcon.linkExternal:
        return 'link-external';
      case SeiIcon.link:
        return 'link';
      case SeiIcon.lockOpen:
        return 'lock-open';
      case SeiIcon.lock:
        return 'lock';
      case SeiIcon.log:
        return 'log';
      case SeiIcon.login:
        return 'login';
      case SeiIcon.logout:
        return 'logout';
      case SeiIcon.menu:
        return 'menu';
      case SeiIcon.message:
        return 'message';
      case SeiIcon.money:
        return 'money';
      case SeiIcon.more:
        return 'more';
      case SeiIcon.music:
        return 'music';
      case SeiIcon.mute:
        return 'mute';
      case SeiIcon.notification:
        return 'notification';
      case SeiIcon.offline:
        return 'offline';
      case SeiIcon.package:
        return 'package';
      case SeiIcon.plugin:
        return 'plugin';
      case SeiIcon.power:
        return 'power';
      case SeiIcon.pricing:
        return 'pricing';
      case SeiIcon.profile:
        return 'profile';
      case SeiIcon.progress:
        return 'progress';
      case SeiIcon.qr:
        return 'qr';
      case SeiIcon.receipt:
        return 'receipt';
      case SeiIcon.refresh:
        return 'refresh';
      case SeiIcon.register:
        return 'register';
      case SeiIcon.remove:
        return 'remove';
      case SeiIcon.restore:
        return 'restore';
      case SeiIcon.router:
        return 'router';
      case SeiIcon.scan:
        return 'scan';
      case SeiIcon.search:
        return 'search';
      case SeiIcon.server:
        return 'server';
      case SeiIcon.settings:
        return 'settings';
      case SeiIcon.share:
        return 'share';
      case SeiIcon.shield:
        return 'shield';
      case SeiIcon.skull:
        return 'skull';
      case SeiIcon.sort:
        return 'sort';
      case SeiIcon.sound:
        return 'sound';
      case SeiIcon.spark:
        return 'spark';
      case SeiIcon.star:
        return 'star';
      case SeiIcon.subscription:
        return 'subscription';
      case SeiIcon.success:
        return 'success';
      case SeiIcon.sync:
        return 'sync';
      case SeiIcon.tab:
        return 'tab';
      case SeiIcon.task:
        return 'task';
      case SeiIcon.team:
        return 'team';
      case SeiIcon.terminal:
        return 'terminal';
      case SeiIcon.timer:
        return 'timer';
      case SeiIcon.uninstall:
        return 'uninstall';
      case SeiIcon.unlock:
        return 'unlock';
      case SeiIcon.update:
        return 'update';
      case SeiIcon.upload:
        return 'upload';
      case SeiIcon.user:
        return 'user';
      case SeiIcon.users:
        return 'users';
      case SeiIcon.variable:
        return 'variable';
      case SeiIcon.verified:
        return 'verified';
      case SeiIcon.version:
        return 'version';
      case SeiIcon.visibilityOff:
        return 'visibility-off';
      case SeiIcon.visibility:
        return 'visibility';
      case SeiIcon.wallet:
        return 'wallet';
      case SeiIcon.warning:
        return 'warning';
      case SeiIcon.wifi:
        return 'wifi';
      case SeiIcon.window:
        return 'window';
    }
  }
}
