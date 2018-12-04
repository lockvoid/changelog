import { replace } from 'feather-icons';

const observer = new MutationObserver(() => {
  replace();
});

observer.observe(document, {
  attributes: true,
  childList: true,
  subtree: true,
});

