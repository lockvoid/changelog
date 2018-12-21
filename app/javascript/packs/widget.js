import './widget.css';
import Popper from 'popper.js';

if (!window.changelogSettings) {
  throw new Error('No Changelog config');
}

const noticeTemplate = ({ id, heading, body }) => `
  <div class="notice-popover popper" x-placement="left" id="changelog-notice-${id}">
    <div class="popper__arrow" x-arrow=""></div>

    ${heading && `
      <h3 class="notice-popover__heading">
        ${heading}
      </h3>
    `}

    <div class="notice-popover__body">
      ${body}
    </div>

    <div class="notice-popover__footer">
      <button type="button" class="notice-popover__button">
        Got It
      </button>
    </div>
  </div>
`;

function serverUrl() {
  return process.env.NODE_ENV === 'development' ? 'http://0.0.0.0:3000' : 'https://sendsay-changelog-production.herokuapp.com';
}

if (!window.changelogLoaded) {
  fetch(`${serverUrl()}/api/projects/${window.changelogSettings.apiKey}.json`).then(res => res.json()).then(project => {
    window.changelogLoaded = true;

    const notices = project.notices;

    function showNotices() {
      for (const notice of notices) {
        const targetElement = document.querySelector(notice.targetElementSelector);
        let noticeElement = document.querySelector(`#changelog-notice-${notice.id}`);

        if (targetElement && !noticeElement) {
          document.body.insertAdjacentHTML('beforeend', noticeTemplate({
            heading: notice.heading,
            body: notice.body,
            id: notice.id,
          }));

          noticeElement = document.querySelector(`#changelog-notice-${notice.id}`)

          notice.popper = new Popper(targetElement, noticeElement, {
            modifiers: {
              offset: {
                offset: '15, 15',
              },
            }
          })

          console.log('tadam')
        }
      }
    }

    const observer = new MutationObserver((a) => {
      showNotices();
    });

    observer.observe(document, {
      attributes: true,
      childList: true,
      subtree: true,
    });

    showNotices();
  })
}
